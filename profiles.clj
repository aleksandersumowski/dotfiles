{:system {:jvm-opts ["-Duser.timezone=UTC"]}
 :user  {:plugins  [[lein-ancient "0.6.15" :exclusions [org.clojure/clojure]]
                    [thomasa/mranderson "0.5.1"]
                    [cider/cider-nrepl "0.21.1"]
                    [lein-pprint "1.2.0"]
                    [jonase/eastwood "0.3.3"]
                    [lein-try "0.4.3"]]
         :repl-options {:init (require 'cljfmt.core)}
         :dependencies [[com.bhauman/rebel-readline "0.1.4"]
                        [cljfmt "0.5.1"]]
         :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}
         :injections []}}
