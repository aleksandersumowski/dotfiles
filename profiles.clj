{:user  {:plugins  [[lein-pprint "1.1.1"]
                    [lein-try "0.4.3"]]
         :dependencies [[org.clojure/tools.namespace "0.2.4"]
                        [redl "0.2.4"]
                        [alembic "0.3.2"]
                        [spyscope "0.1.5"]
                        [leiningen #=(leiningen.core.main/leiningen-version)]
                        [im.chit/vinyasa "0.3.3"]]
         :injections [(require '[vinyasa.inject :as inject])
                      (inject/in
                        ;; the default injected namespace is `.`

                        ;; note that `:refer, :all and :exclude can be used
                        [vinyasa.inject :refer [inject [in inject-in]]]

                        ;; imports all functions in vinyasa.pull
                        [alembic.still :all]

                        ;; inject into clojure.core
                        clojure.core
                        [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]
                        [clojure.repl doc source]

                        ;; inject into clojure.core with prefix
                        clojure.core >
                        [clojure.pprint pprint]
                        [clojure.java.shell sh])]}}
