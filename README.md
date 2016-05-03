# elpaaso-starter-parent

[![Build Status](https://travis-ci.org/Orange-OpenSource/elpaaso-starter-parent.svg?branch=master)](https://travis-ci.org/Orange-OpenSource/elpaaso-starter-parent)
[![Apache Version 2 Licence](http://img.shields.io/:license-Apache%20v2-blue.svg)](LICENSE.md)
[![Bintray](https://www.bintray.com/docs/images/bintray_badge_color.png)](https://bintray.com/elpaaso/maven/elpaaso-starter-parent/view?source=watch)
[![JCenter](https://img.shields.io/badge/JCenter-available-blue.svg)](https://bintray.com/bintray/jcenter?filterByPkgName=elpaaso-starter-parent)
[![Open Hub](http://img.shields.io/badge/Open%20Hub-analyze-blue.svg)](https://www.openhub.net/p/elpaaso-starter-parent)

[![Join the chat at https://gitter.im/Orange-OpenSource/elpaaso](https://img.shields.io/badge/gitter-join%20chat%20→-brightgreen.svg)](https://gitter.im/Orange-OpenSource/elpaaso?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)




This repo host a common parent based on spring-boot to avoid plugin configuration duplication.


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
