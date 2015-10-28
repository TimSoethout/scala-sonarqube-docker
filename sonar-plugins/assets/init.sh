#!/bin/bash
set -e
set -x

mkdir -p ${SONAR_PLUGINS_DOWNLOADS_DIR}

# Install the latest version of the plugins
ls -al ${SONAR_PLUGINS_DOWNLOADS_DIR}

cd ${SONAR_PLUGINS_DOWNLOADS_DIR}

# From Sonar
# TODO: use http://update.sonarsource.org/update-center.properties to get the latest versions
wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-generic-coverage-plugin/1.1/sonar-generic-coverage-plugin-1.1.jar | true
wget -N https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-3.5.jar | true
wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-scm-git-plugin/1.1/sonar-scm-git-plugin-1.1.jar | true
wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-jira-plugin/1.2/sonar-jira-plugin-1.2.jar | true
wget -N https://github.com/racodond/sonar-jproperties-plugin/releases/download/1.3/sonar-jproperties-plugin-1.3.jar | true
wget -N https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-2.8.jar | true
wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/java/sonar-checkstyle-plugin/2.3/sonar-checkstyle-plugin-2.3.jar | true
wget -N https://sonarsource.bintray.com/Distribution/sonar-findbugs-plugin/sonar-findbugs-plugin-3.3.jar | true
wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-cobertura-plugin/1.6.3/sonar-cobertura-plugin-1.6.3.jar | true

# 3rd party plugins
echo "Sonar scala plugin from https://github.com/SonarCommunity/sonar-scala/pull/11 (the pull request is not merged yet at time of committing, but needed for Sonar 5) - fetched from my repository at the moment"
wget -N https://github.com/TimSoethout/sonar-scala/releases/download/sonar-scala-plugin-1.1.3-SNAPSHOT/sonar-scala-plugin-1.1.3-SNAPSHOT.jar | true
wget -N https://github.com/emrehan/sonar-scalastyle/releases/download/v0.0.1-SNAPSHOT/sonar-scalastyle-plugin-0.0.1-SNAPSHOT.jar | true
wget -N https://github.com/RadoBuransky/sonar-scoverage-plugin/releases/download/v5.1.1/sonar-scoverage-plugin-5.1.1.jar | true
wget -N https://github.com/porscheinformatik/sonar-find-sec-bugs-plugin/releases/download/1.2.0/sonar-find-sec-bugs-plugin-1.2.0.jar | true

true
