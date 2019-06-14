{:system {:jvm-opts ["-Duser.timezone=UTC"]}
 :user  {:plugins  [[lein-ancient "0.6.15" :exclusions [org.clojure/clojure]]
                    [expound "0.7.2"]
                    [jonase/eastwood "0.3.3"]
                    [lein-localrepo "0.5.4"]
                    [lein-try "0.4.3"]]
         :repl-options {:init (require 'cljfmt.core)}
         :dependencies [[cljfmt "0.5.1"]]
         :aliases {}
         :injections []}
 :rebl {:repl-options {:nrepl-middleware [nrebl.middleware/wrap-nrebl]}
        :injections [(require '[cognitect.rebl :as rebl]
                              '[clojure.java.jdbc.datafy :as jdbc-datafy])]
        :dependencies [[org.clojure/core.async "0.4.490"]
                       [com.cognitect/rebl "0.9.172"]
                       [rickmoynihan/nrebl.middleware "0.2.0"]
                       [org.openjfx/javafx-fxml     "11.0.2"]
                       [org.clojure/java.jdbc "0.7.9"]
                       [org.openjfx/javafx-controls "11.0.2"]
                       [org.openjfx/javafx-swing    "11.0.2"]
                       [org.openjfx/javafx-base     "11.0.2"]
                       [org.openjfx/javafx-web      "11.0.2"]]}}
