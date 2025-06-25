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
  version = "2.0.0";

  src = fetchzip {
    url = "https://registry.npmjs.org/@aku11i/phantom/-/phantom-${version}.tgz";
    hash = "sha256-7ZmIshnWXsKJnIqALC3GzJqNy+tetEvqyJDBLoHcHXM=";
  };

  npmDepsHash = "sha256-kH/LNWBUX7nUebWH5zALAUjKxEcrz7DcI2efl2U/54M=";

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
