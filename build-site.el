(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;;Initialize package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;;Install dependencies
(package-install 'htmlize)




;; Load the publishing system
(require 'ox-publish)


;;Customize the HTML output
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\"/>")


;;Define the publishing project
(setq org-publish-project-alist
      (list
       (list "CAG"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html)))

;;Generate the site output
(org-publish-all t)

(message "Build complete!")
