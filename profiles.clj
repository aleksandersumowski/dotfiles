{:user  {:plugins  [[cider/cider-nrepl "0.8.2"]
                    [lein-pprint "1.1.1"]
                    [lein-try "0.4.3"]]
         :dependencies [[org.clojure/tools.namespace "0.2.4"]
                        [org.clojure/tools.trace "0.7.8"]
                        [redl "0.2.4"]
                        [alembic "0.3.2"]
                        [spyscope "0.1.5"]
                        [debug-repl "0.3.2"]
                        [debugger "0.1.7"]
                        [im.chit/vinyasa "0.3.4"]]
         :injections [(require '[vinyasa.inject :as inject])
                      (inject/in
                        ;; the default injected namespace is `.`

                        ;; note that `:refer, :all and :exclude can be used
                        [vinyasa.inject :refer [inject [in inject-in]]]
                        [alembic.still :all]
                        ;; inject into clojure.core
                        clojure.core
                        [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]
                        [clojure.tools.trace :all]

                        ;; inject into clojure.core with prefix
                        clojure.core >
                        [clojure.pprint pprint]
                        [clojure.java.shell sh])]}}
