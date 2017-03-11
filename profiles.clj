{:system {:jvm-opts ["-Duser.timezone=UTC"]}
 :user  {:plugins  [[cider/cider-nrepl "0.11.0"]
                    [lein-ancient "0.6.10" :exclusions [org.clojure/clojure]]
                    [clj-stacktrace "0.2.8"]
                    [lein-try "0.4.3"]]
         :dependencies []
         :injections []}}
