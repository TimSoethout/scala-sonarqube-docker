#!/bin/bash
set -e
set -x

# Install the latest version of the plugins

ls -al ${SONAR_PLUGINS_DOWNLOADS_DIR}

cd ${SONAR_PLUGINS_DOWNLOADS_DIR}



getPluginDownloadUrl() {
  curl http://update.sonarsource.org/update-center.properties | grep $1 | sort -V | grep downloadUrl | tail -1 | cut -d'=' -f2 | sed -r 's/\\(.)/\1/g'
}

# From Sonar
# use http://update.sonarsource.org/update-center.properties to get the latest versions

# TODO: https://github.com/arthepsy/sonar-scala-extra/releases

declare -a plugins=("sonar-java-plugin"
"sonar-cobertura-plugin"
"sonar-generic-coverage-plugin"
"sonar-scm-git-plugin"
"sonar-jira-plugin"
"sonar-javascript-plugin"
"sonar-checkstyle-plugin"
"sonar-findbugs-plugin")

for plugin in "${plugins[@]}"; do
  echo "Downloading $plugin"
  wget -N "$(getPluginDownloadUrl $plugin)" | true
done

# wget -N $(getPluginDownloadUrl sonar-generic-coverage-plugin) | true
# wget -N https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-3.5.jar | true
# wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-scm-git-plugin/1.1/sonar-scm-git-plugin-1.1.jar | true
# wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-jira-plugin/1.2/sonar-jira-plugin-1.2.jar | true
# wget -N https://github.com/racodond/sonar-jproperties-plugin/releases/download/1.3/sonar-jproperties-plugin-1.3.jar | true
# wget -N https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-2.8.jar | true
# wget -N http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/java/sonar-checkstyle-plugin/2.3/sonar-checkstyle-plugin-2.3.jar | true
# wget -N https://sonarsource.bintray.com/Distribution/sonar-findbugs-plugin/sonar-findbugs-plugin-3.3.jar | true

# 3rd party plugins
echo "Sonar scala plugin from https://github.com/SonarCommunity/sonar-scala/pull/11 (the pull request is not merged yet at time of committing, but needed for Sonar 5) - fetched from my repository at the moment"
wget -N https://github.com/TimSoethout/sonar-scala/releases/download/sonar-scala-plugin-1.1.3-SNAPSHOT/sonar-scala-plugin-1.1.3-SNAPSHOT.jar | true
wget -N https://github.com/TimSoethout/sonar-scalastyle/releases/download/0.0.4/sonar-scalastyle-0.0.4.jar | true
wget -N https://github.com/TimSoethout/sonar-scoverage-plugin/releases/download/5.3.0-SNAPSHOT/sonar-scoverage-plugin-5.3.0-SNAPSHOT.jar | true
wget -N https://github.com/porscheinformatik/sonar-find-sec-bugs-plugin/releases/download/1.2.0/sonar-find-sec-bugs-plugin-1.2.0.jar | true
wget -N https://github.com/arthepsy/sonar-scala-extra/releases/download/v1.3.0/sonar-scapegoat-plugin-1.3.0.jar | true
