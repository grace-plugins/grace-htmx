# Grace with Htmx

Grace Plugin for using Grace app with htmx.


## Usage

Add dependency to the `build.gradle`,

```gradle

repositories {
    mavenCentral()
}

dependencies {
    implementation "org.graceframework.plugins:htmx:0.0.1-SNAPSHOT"
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

## Example

* [Grace Htmx TodoMVC](https://github.com/grace-guides/grace-htmx-todomvc)

## Development

### Build from source

```
git clone https://github.com/grace-plugins/grace-htmx.git
cd grace-htmx
./gradlew publishToMavenLocal
```

## Support Grace Version

* Grace 2022.0.0

## Roadmap

### 1.x

* Htmx 1.9

### 2.x

* Htmx 2.0

## License

This plugin is available as open source under the terms of the [APACHE LICENSE, VERSION 2.0](http://apache.org/Licenses/LICENSE-2.0)

## Links

- [Grace Website](https://github.com/graceframework/grace-framework)
- [Grace Plugins](https://github.com/grace-plugins)
- [Grace Htmx Plugin](https://github.com/grace-plugins/grace-htmx)
- [Grace Htmx TodoMVC](https://github.com/grace-guides/grace-htmx-todomvc)
