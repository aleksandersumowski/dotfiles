{:system {:jvm-opts ["-Duser.timezone=UTC"]}
 :user  {:plugins  [[lein-ancient "0.6.15" :exclusions [org.clojure/clojure]]
                    [clj-stacktrace "0.2.8"]
                    [lein-pprint "1.2.0"]
                    [jonase/eastwood "0.2.9"]
                    [lein-try "0.4.3"]]
         :dependencies [[com.bhauman/rebel-readline "0.1.4"]]
         :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}
         :injections []}}
