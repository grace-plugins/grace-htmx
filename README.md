[![Main branch build status](https://github.com/grace-plugins/grace-htmx/workflows/Grace%20CI/badge.svg?style=flat)](https://github.com/grace-plugins/grace-htmx/actions?query=workflow%3A%Grace+CI%22)
[![Apache 2.0 license](https://img.shields.io/badge/License-APACHE%202.0-green.svg?logo=APACHE&style=flat)](https://opensource.org/licenses/Apache-2.0)
[![Latest version on Maven Central](https://img.shields.io/maven-central/v/org.graceframework.plugins/htmx.svg?label=Maven%20Central&logo=apache-maven&style=flat)](https://search.maven.org/search?q=g:org.graceframework.plugins)
[![Grace on X](https://img.shields.io/twitter/follow/graceframework?style=social)](https://twitter.com/graceframework)

# Grace with Htmx

Grace Plugin for using Grace/Grails app with htmx.


## Usage

Add dependency to the `build.gradle`,

```gradle

repositories {
    mavenCentral()
}

dependencies {
    implementation "org.graceframework.plugins:htmx:VERSION"
}
```

Htmx plugin supports controller-specific `withFormat()` method,

```groovy
class BookController {

    def list() {
        def books = Book.list()

        withFormat {
            htmx {
                render(template: "book", model: [bookList: books])
            }
            json {
                render books as JSON
            }
        }
    }
}
```

Also, this plugin supports extendsions for Grails Request and Response,

```groovy
// You can get htmx request headers from Grails Request

request.htmx.boosted == request.getHeader('HX-Boosted')
request.htmx.target  == request.getHeader('HX-Target')

// Check htmx request?
if (request.htmx as boolean) { // or use request.isHtmx()
    template = 'book-detail'
}

// You can set htmx response headers in Grails

response.htmx.trigger = 'itemAdded'

```

If you use [`respond`](https://grails.github.io/legacy-grails-doc/4.0.0/ref/Controllers/respond.html) method introduced in Grails 2.3. The respond method tries to produce the most appropriate response for the requested content type (JSON, XML, HTML etc.)

You can [configure mime types](https://grails.github.io/legacy-grails-doc/4.0.0/guide/theWebLayer.html#contentNegotiation) for Htmx.

Update the `app/conf/application.yml`:

```yml
grails:
    mime:
        types:
            htmx: text/html
```

For example given the show action:

```groovy
def show(Book book) {
    respond book
}
```

You could supply a `show.htmx.gsp` file to render the HTMX:

```html
<div id="${book.id}">
    <h1>${book.title}</h1>
    <p>${book.description}</p>
</div>
```

If you use `asset-pipeline` plugin, this plugin already includes `htmx.js`, `_hyperscript.js`,
so you can add `htmx.js` to the `app/assets/application.js`,

```javascript
//= require _hyperscript
//= require htmx
//= require_self
```

Also, you can use `asset` tag in the GSP,

```HTML
<asset:javascript src="_hyperscript.js"/>
<asset:javascript src="htmx.js"/>
```


## Example

* [Grace Htmx TodoMVC](https://github.com/grace-guides/gs-htmx-todomvc)

## Development

### Build from source

```
git clone https://github.com/grace-plugins/grace-htmx.git
cd grace-htmx
./gradlew publishToMavenLocal
```

## Support Version

* Grace 2022.0.0+
* Grails 3.0+

## Roadmap

### 1.x

* Htmx 1.9

### 2.x

* Htmx 2.0

## License

This plugin is available as open source under the terms of the [APACHE LICENSE, VERSION 2.0](http://apache.org/Licenses/LICENSE-2.0)

## Links

- [Grace Framework](https://github.com/graceframework/grace-framework)
- [Grace Plugins](https://github.com/grace-plugins)
- [Grace Htmx Plugin](https://github.com/grace-plugins/grace-htmx)
- [Grace Htmx TodoMVC](https://github.com/grace-guides/grace-htmx-todomvc)
- [Grails Htmx TodoMVC](https://github.com/rainboyan/grails-htmx-todomvc)
