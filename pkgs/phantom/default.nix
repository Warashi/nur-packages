{
  fetchzip,
  buildNpmPackage,
  lib,
  nodejs,
  git,
  makeWrapper,
}:
buildNpmPackage rec {
  pname = "phtantom";
  version = "1.3.0";

  src = fetchzip {
    url = "https://registry.npmjs.org/@aku11i/phantom/-/phantom-${version}.tgz";
    hash = "sha256-oFUSbEWp3OkoGYbCdPg+z2mqsVtsBE8uKrcv9IovK2A=";
  };

  npmDepsHash = "sha256-p2wRi3Qcj2ZfUWfhMqW7bNB0F0XXvy1G8+RZLvu6Rhc=";

  dontNpmBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $src/phantom.js $out/bin/phantom

    runHook postInstall
  '';

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  passthru.updateScript = ./update.sh;

  meta = {
    description = "A powerful CLI tool for seamless parallel development with Git worktrees.";
    homepage = "https://github.com/aku11i/phantom";
    downloadPage = "https://www.npmjs.com/package/@aku11i/phantom";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "phantom";
  };
}
