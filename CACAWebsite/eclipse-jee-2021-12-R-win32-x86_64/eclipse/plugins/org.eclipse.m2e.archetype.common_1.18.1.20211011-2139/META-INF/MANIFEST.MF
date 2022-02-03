Manifest-Version: 1.0
Created-By: Apache Maven Bundle Plugin
Build-Jdk-Spec: 11
Automatic-Module-Name: org.eclipse.m2e.archetype.common
Bnd-LastModified: 1633988484718
Build-Jdk: 11.0.2
Built-By: jenkins
Bundle-ClassPath: .,jars/archetype-common-2.4.jar,jars/archetype-catalog
 -2.4.jar,jars/archetype-descriptor-2.4.jar,jars/archetype-registry-2.4.
 jar,jars/jchardet-1.0.jar,jars/jdom-1.0.jar,jars/maven-invoker-2.1.1.ja
 r,jars/commons-io-2.2.jar,jars/plexus-velocity-1.1.8.jar,jars/velocity-
 1.5.jar,jars/commons-lang-2.1.jar,jars/oro-2.0.8.jar,jars/dom4j-2.1.3.j
 ar,jars/commons-collections-3.2.2.jar
Bundle-Description: Maven Integration for Eclipse provides tight integra
 tion		for Maven into the IDE
Bundle-DocURL: https://eclipse.org/m2e
Bundle-License: https://www.eclipse.org/legal/epl-v20.html
Bundle-ManifestVersion: 2
Bundle-Name: M2E Maven Archetype Common
Bundle-RequiredExecutionEnvironment: JavaSE-11
Bundle-SymbolicName: org.eclipse.m2e.archetype.common;singleton:=false
Bundle-Vendor: Eclipse.org - m2e
Bundle-Version: 1.18.1.20211011-2139
Eclipse-BundleShape: dir
Embed-Dependency: *;scope=compile|runtime
Embed-Directory: jars
Embed-Transitive: true
Embedded-Artifacts: jars/archetype-common-2.4.jar;g="org.apache.maven.ar
 chetype";a="archetype-common";v="2.4",jars/archetype-catalog-2.4.jar;g=
 "org.apache.maven.archetype";a="archetype-catalog";v="2.4",jars/archety
 pe-descriptor-2.4.jar;g="org.apache.maven.archetype";a="archetype-descr
 iptor";v="2.4",jars/archetype-registry-2.4.jar;g="org.apache.maven.arch
 etype";a="archetype-registry";v="2.4",jars/jchardet-1.0.jar;g="net.sour
 ceforge.jchardet";a="jchardet";v="1.0",jars/jdom-1.0.jar;g="jdom";a="jd
 om";v="1.0",jars/maven-invoker-2.1.1.jar;g="org.apache.maven.shared";a=
 "maven-invoker";v="2.1.1",jars/commons-io-2.2.jar;g="commons-io";a="com
 mons-io";v="2.2",jars/plexus-velocity-1.1.8.jar;g="org.codehaus.plexus"
 ;a="plexus-velocity";v="1.1.8",jars/velocity-1.5.jar;g="org.apache.velo
 city";a="velocity";v="1.5",jars/commons-lang-2.1.jar;g="commons-lang";a
 ="commons-lang";v="2.1",jars/oro-2.0.8.jar;g="oro";a="oro";v="2.0.8",ja
 rs/dom4j-2.1.3.jar;g="org.dom4j";a="dom4j";v="2.1.3",jars/commons-colle
 ctions-3.2.2.jar;g="commons-collections";a="commons-collections";v="3.2
 .2"
Export-Package: org.apache.maven.archetype;provider=m2e;mandatory:=provi
 der;x-internal:=true,org.apache.maven.archetype.catalog;provider=m2e;ma
 ndatory:=provider;x-internal:=true,org.apache.maven.archetype.catalog.i
 o.xpp3;provider=m2e;mandatory:=provider;x-internal:=true,org.apache.mav
 en.archetype.common;provider=m2e;mandatory:=provider;x-internal:=true,o
 rg.apache.maven.archetype.common.util;provider=m2e;mandatory:=provider;
 x-internal:=true,org.apache.maven.archetype.creator;provider=m2e;mandat
 ory:=provider;x-internal:=true,org.apache.maven.archetype.downloader;pr
 ovider=m2e;mandatory:=provider;x-internal:=true,org.apache.maven.archet
 ype.exception;provider=m2e;mandatory:=provider;x-internal:=true,org.apa
 che.maven.archetype.generator;provider=m2e;mandatory:=provider;x-intern
 al:=true,org.apache.maven.archetype.metadata;provider=m2e;mandatory:=pr
 ovider;x-internal:=true,org.apache.maven.archetype.metadata.io.xpp3;pro
 vider=m2e;mandatory:=provider;x-internal:=true,org.apache.maven.archety
 pe.model;provider=m2e;mandatory:=provider;x-internal:=true,org.apache.m
 aven.archetype.model.io.xpp3;provider=m2e;mandatory:=provider;x-interna
 l:=true,org.apache.maven.archetype.old;provider=m2e;mandatory:=provider
 ;x-internal:=true,org.apache.maven.archetype.old.descriptor;provider=m2
 e;mandatory:=provider;x-internal:=true,org.apache.maven.archetype.regis
 try;provider=m2e;mandatory:=provider;x-internal:=true,org.apache.maven.
 archetype.registry.io.xpp3;provider=m2e;mandatory:=provider;x-internal:
 =true,org.apache.maven.archetype.repositorycrawler;provider=m2e;mandato
 ry:=provider;x-internal:=true,org.apache.maven.archetype.source;provide
 r=m2e;mandatory:=provider;x-internal:=true,org.codehaus.plexus.velocity
 ;provider=m2e;mandatory:=provider;x-internal:=true,META-INF.plexus;x-in
 ternal:=true
Require-Bundle: org.eclipse.m2e.maven.runtime;bundle-version="[1.18.0,1.
 19.0)"
Require-Capability: osgi.ee;filter:="(&(osgi.ee=JavaSE)(version=1.8))"
Tool: Bnd-5.1.1.202006162103
Eclipse-SourceReferences: scm:git:https://github.com/eclipse-m2e/m2e-cor
 e.git;path="m2e-maven-runtime/org.eclipse.m2e.archetype.common";commitI
 d=909efaf1a9ab251bfde7acb9562a3d9f1028c18f

Name: about.html
SHA-256-Digest: DxLx0DTl4ABpKBHRrXGr0ORKBalPMev/EsgIotrdbBk=

Name: jars/plexus-velocity-1.1.8.jar
SHA-256-Digest: NrPqPQzvA/Nr0sTg80cpw96A/TdQWb3Mv1KxCkLG7Cw=

Name: META-INF/maven/org.eclipse.m2e/org.eclipse.m2e.archetype.common/po
 m.xml
SHA-256-Digest: d6HXvRuiw+wMnBmY9tF8QSI6pDrrvtFrhXnli316D78=

Name: about_files/LICENSE-2.0.txt
SHA-256-Digest: z8d0m5b2O9McPEK1xHG/dWgUBT6EfBDz6wA0F7xSPTA=

Name: jars/archetype-descriptor-2.4.jar
SHA-256-Digest: PITAWIPDoc6blZILN65azk/GVqeoP8JyXFf5luMMrLw=

Name: jars/maven-invoker-2.1.1.jar
SHA-256-Digest: kCQPBpVj14WzxUYpSey+cN5FGnw83HlpzZkTEDyVne8=

Name: META-INF/maven/org.eclipse.m2e/org.eclipse.m2e.archetype.common/po
 m.properties
SHA-256-Digest: +9/fw42bV8meyxUYzxj3TgEVl7tRyfbvCTwFAecJrfw=

Name: about_files/MPL-1.1.txt
SHA-256-Digest: U2kqLtbGosbsmzLdC4IN+ukeCh/N9iXKntC9+HBfzE8=

Name: jars/archetype-common-2.4.jar
SHA-256-Digest: cN7zd81WuNk+uEz1GyvfKmZbmv2RrPLyZ6INrVx2HI8=

Name: jars/commons-lang-2.1.jar
SHA-256-Digest: Le1zQ9yOV97NXmMCM3E5vgIP3YhaKTWSXo1XWXXkgLk=

Name: about_files/LICENSE-1.1.txt
SHA-256-Digest: FBcHXy6BVFZgGFQw7H9nhH07zql7BghmxDbWPr9L4NQ=

Name: about_files/dom4j-LICENSE.txt
SHA-256-Digest: TyOjxKnEI0jLNbwJJJJYhccKdwj7gYk2KHFICUB1XBQ=

Name: about_files/jdom-LICENSE.txt
SHA-256-Digest: 0GIlO9PHt1PTfZtjKJBLA40cO4C5Zgwhr/uqhcgX1GI=

Name: jars/jchardet-1.0.jar
SHA-256-Digest: rcUfzofGlnYkrrymonLZVtIzwOvqEe592116azVqkKA=

Name: jars/archetype-registry-2.4.jar
SHA-256-Digest: wMa/CyAZOwHswURLS2hJ+StoDlgtZn58nbjXit8ut7Y=

Name: jars/commons-io-2.2.jar
SHA-256-Digest: Z19gvRGoLUgXNlkf5AVMZkcfpUY9RWFmUv1xWFeSuoc=

Name: jars/commons-collections-3.2.2.jar
SHA-256-Digest: 7urpF5FxRKaKdB1MDf9mqlxcX9hVk/8he87T/Iyng7g=

Name: jars/velocity-1.5.jar
SHA-256-Digest: 4GQD+c1pAz5SO+xDGVoqG2EG4oxdfQU7VprncenkmmI=

Name: jars/dom4j-2.1.3.jar
SHA-256-Digest: VJ8wB8YpD2qQHlfR0zG07Q5r9zhPeL8QMW/87sqDTeY=

Name: jars/oro-2.0.8.jar
SHA-256-Digest: 4AzNrV3360P97kQjLvZGAr9jgHwtEzp76Dugn9Sa8m4=

Name: jars/archetype-catalog-2.4.jar
SHA-256-Digest: Ai5O8njFda7KH0NkzqbxFGqQmFinC6zEhHOm46GC3g4=

Name: jars/jdom-1.0.jar
SHA-256-Digest: OyO8OXmuwUqVKhKq/EgwENxXV5d18v/KzvUlapDu2gI=

