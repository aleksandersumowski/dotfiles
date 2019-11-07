{:system {:jvm-opts ["-Duser.timezone=UTC"]}
 :user  {:plugins  []
         :repl-options {}
         :dependencies [[org.clojure/tools.deps.alpha "0.8.578"]]
         :aliases {}
         :injections []}
 :cider  {:plugins [[cider/cider-nrepl "0.22.0-beta8"]
                    [refactor-nrepl "2.5.0-SNAPSHOT"]]}
 :extras {:plugins [[expound "0.7.2"]
                    [jonase/eastwood "0.3.3"]
                    [lein-localrepo "0.5.4"]
                    [lein-try "0.4.3"]
                    [lein-pprint "1.2.0"]
                    [lein-ancient "0.6.15" :exclusions [org.clojure/clojure]]]}
 :prepl {:jvm-opts ["-Dclojure.server.repl={:port,5555,:accept,clojure.core.server/io-prepl}"]}
 :rebl {:injections [(require '[cognitect.rebl :as rebl]
                              '[clojure.java.jdbc.datafy :as jdbc-datafy])]
        :dependencies [[cljfmt "0.6.4"]
                       [org.clojure/core.async "0.4.490"]
                       [com.cognitect/rebl "0.9.220"]
                       [org.openjfx/javafx-fxml     "11.0.2"]
                       [org.clojure/java.jdbc "0.7.9"]
                       [org.openjfx/javafx-controls "11.0.2"]
                       [org.openjfx/javafx-swing    "11.0.2"]
                       [org.openjfx/javafx-base     "11.0.2"]
                       [org.openjfx/javafx-web      "11.0.2"]]}}
