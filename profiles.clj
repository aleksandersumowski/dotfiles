{:user  {:plugins  [[venantius/ultra "0.1.9"]]
         :dependencies [[org.clojure/tools.namespace "0.2.4"]
                        [leiningen #=(leiningen.core.main/leiningen-version)]
                        [im.chit/vinyasa "0.3.0"]]
         :injections [(require '[vinyasa.inject :as inject])
                      (inject/in)  ]
         :ultra  {:color-scheme :solarized_dark}}}
