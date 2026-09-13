package grace.demos

import grails.gorm.transactions.Transactional
import net.datafaker.Faker

class Bootstrap {

    @Transactional
    def init() {
        Faker faker = new Faker()
        (1..100).each {
            String firstName = faker.name().firstName()
            String lastName = faker.name().lastName()
            String email = "${firstName.toLowerCase(Locale.ROOT)}.${lastName.toLowerCase(Locale.ROOT)}@example.com"
            new Contact(firstName: firstName, lastName: lastName, email: email).save()
        }
    }

    def destroy() {
    }

}
