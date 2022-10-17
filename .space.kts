/**
* JetBrains Space Automation
* This Kotlin-script file lets you automate build activities
* For more info, see https://www.jetbrains.com/help/space/automation.html
*/

job("Run me on git push and at 8 AM UTC") {

    startOn {
        gitPush { enabled = true }
        schedule { cron("0 8 * * *") }
    }
    
    requirements {
        workerPool = WorkerPools.SELF_HOSTED // not necessary if workerType is specified
        
    }
    
    host("link pods") {
        shellScript {  
            content = """
                pwd
                JB_SPACE_STEP_DATA_PATH
                rm -f Gemfile.lock
                rm -f Podfile.lock
                rm -f Pods
                ln -s ~/Desktop/jetbrains/mobPods/Pods
                ln -s ~/Desktop/jetbrains/mobPods/Podfile.lock
                ln -s ~/Desktop/jetbrains/mobPods/Gemfile.lock
            """
        }
    }

        host("Bundle install") {
            shellScript {  
                content = """
                bundle env
                bundle install
                bundle exec pod deintegrate
                bundle exec pod install
                """  
            }
        }
    

    host("fastlane") {

        shellScript {  
                content = "bundle exec fastlane tests"
                 
            }
    }
}


