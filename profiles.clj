{:user  {:plugins  [[venantius/ultra "0.1.9"]]
         :repl-options {:caught clj-stacktrace.repl/pst+}
         :dependencies [[org.clojure/tools.namespace "0.2.4"]
                        [redl "0.2.4"]
                        [spyscope "0.1.5"]
                        [leiningen #=(leiningen.core.main/leiningen-version)]
                        [im.chit/vinyasa "0.3.3"]]
         :injections [(require '[redl core complete])
                      (require 'spyscope.core)
                      (require '[vinyasa.inject :as inject])
                      (inject/in
                        ;; the default injected namespace is `.`

                        ;; note that `:refer, :all and :exclude can be used
                        [vinyasa.inject :refer [inject [in inject-in]]]
                        [vinyasa.lein :exclude [*project*]]

                        ;; imports all functions in vinyasa.pull
                        [vinyasa.pull :all]

                        ;; same as [cemerick.pomegranate :refer [add-classpath get-classpath resources]]
                        [cemerick.pomegranate add-classpath get-classpath resources]

                        ;; inject into clojure.core
                        clojure.core
                        [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

                        ;; inject into clojure.core with prefix
                        clojure.core >
                        [clojure.pprint pprint]
                        [clojure.java.shell sh])]
         :ultra  {:color-scheme :solarized_dark}}}
