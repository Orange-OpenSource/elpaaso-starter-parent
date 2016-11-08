# ElPaaSo starter parent

[![Build Status](https://travis-ci.org/orange-cloudfoundry/elpaaso-starter-parent.svg?branch=master)](https://travis-ci.org/orange-cloudfoundry/elpaaso-starter-parent)
[![Apache Version 2 Licence](http://img.shields.io/:license-Apache%20v2-blue.svg)](LICENSE.md)
[![Bintray](https://www.bintray.com/docs/images/bintray_badge_color.png)](https://bintray.com/elpaaso/maven/elpaaso-starter-parent/view?source=watch)
[![JCenter](https://img.shields.io/badge/JCenter-available-blue.svg)](https://bintray.com/bintray/jcenter?filterByPkgName=elpaaso-starter-parent)
[![Open Hub](http://img.shields.io/badge/Open%20Hub-analyze-blue.svg)](https://www.openhub.net/p/elpaaso-starter-parent)
[![Join the chat at https://gitter.im/Orange-OpenSource/elpaaso](https://img.shields.io/badge/gitter-join%20chat%20→-brightgreen.svg)](https://gitter.im/Orange-OpenSource/elpaaso?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)



This repo is a pom used to share plugin configurations and profiles, not included in [Spring Boot](http://projects.spring.io/spring-boot/), by default.
The pom inherits from spring-boot, and avoids plugin configuration duplication.

Main plugin configuration shared:
 * license-maven-plugin to handle license operations
 * [coveralls](https://coveralls.io) to code quality
 * artifactory-maven-plugin to easy deployment on [OJO](http://oss.jfrog.org/)
 * etc ...

Main profiles:
 * license-add, license-skip-check, license-remove: license management - Default: license-check
 * skip-git-info: disable git-commit-id-plugin - Default: enabled
 * ojo-build-info: generate build info to deploy at [OJO](http://oss.jfrog.org/)
 * bintray-elpaaso-maven: add ElPaaSo maven repo (hosted on [bintray](https://bintray.com/elpaaso/maven))


It also use [elpaaso-build-tools](https://github.com/orange-cloudfoundry/elpaaso-build-tools).

## releasing

### manual
enable bintray-elpaaso-maven to add bintray in distribution management

`mvnw -e release:prepare release:perform -Plicense-skip-check,bintray-elpaaso-maven`


### automatic
 * WIP


![Build overview schema](http://g.gravizo.com/g?
  digraph G {
    size ="5,5";
    github [shape=box];
    travis [shape=box]
    developer -> github [label="git push"] 
    github -> travis [weight=8];
    travis -> travis [style=bold,label="mvn deploy"]
    travis -> Bintray [style=bold,label="mvn deploy"]
    edge [color=blue];
    travis -> github [style=dotted,label="Add release"]
    edge [color=black];
    Bintray -> JCenter
    JCenter -> Bintray
    Bintray [label="Bintray (releases)", shape=box]
  }
)
