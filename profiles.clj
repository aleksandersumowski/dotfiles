{:user  {:plugins  [[cider/cider-nrepl "0.9.1"]
                    [lein-pprint "1.1.1"]
                    [lein-try "0.4.3"]]
         :aliases {"slamhound" ["run" "-m" "slam.hound"]}
         :dependencies [[org.clojure/tools.namespace "0.2.4"]
                        [org.clojure/tools.trace "0.7.8"]
                        [redl "0.2.4"]
                        [alembic "0.3.2"]
                        [spyscope "0.1.5"]
                        [slamhound "1.5.5"]
                        [debug-repl "0.3.2"]
                        [im.chit/hara.reflect "2.2.3"]
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
                        [hara.reflect query-class query-instance]
                        [clojure.java.shell sh])]}}
