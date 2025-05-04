{
  emacsPackagesFor,
  emacs-nox,
}:
(emacsPackagesFor emacs-nox).emacsWithPackages (
  epkgs: with epkgs; [
    org
    ox-zenn
  ]
)
