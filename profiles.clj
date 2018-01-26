{:system {:jvm-opts ["-Duser.timezone=UTC"]}
 :user  {:plugins  [[lein-ancient "0.6.12" :exclusions [org.clojure/clojure]]
                    [clj-stacktrace "0.2.8"]
                    [lein-try "0.4.3"]]
         :dependencies []
         :injections []}}
