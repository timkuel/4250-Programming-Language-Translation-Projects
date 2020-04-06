"""
Author:     Timothy Kuelker
Date:       November 1, 2019
Course:     CMPSCI 4250 - Programming Languages
Description:Program has a class product, it then has 2 polymorphic classes movie and book,
which are both products as well.  The program shows the use of a polymorphic call to the function
print_description().  It will print a description based off whether it is a movie, book,
or just a product.
"""


class Product:

    """ Initializing Object """
    def __init__(self, name, price, discount_percent):
        self.name = name
        self.price = price
        self.discount_percent = discount_percent

    """ Get methods used to calculate then get the discount amount and price """
    def get_discount_amount(self):
        discount_amount = self.price * (self.discount_percent / 100)
        return discount_amount

    def get_discount_price(self):
        discount_price = self.price - self.get_discount_amount()
        return discount_price

    """ Printing Description """
    def print_description(self):
        print("\nProduct Name: " + str(self.name) +
              "\nOriginal Price: ${:.2f}".format(self.price) +
              "\nDiscount Percentage: " + str(self.discount_percent) + "%" +
              "\nDiscount Amount: ${:.2f}".format(self.get_discount_amount()) +
              "\nDiscounted Price: ${:.2f}".format(self.get_discount_price()))


""" Polymorphic class Book, that IS A product """
class Book(Product):
    def __init__(self, name, author, price, discount_percent):
        super().__init__(name, price, discount_percent)
        self.author = author

    """ Polymorphic Printing Description of a Book"""
    def print_description(self):
        print("\nBook Title: " + str(self.name) +
              "\nWritten By: " + str(self.author) +
              "\nOriginal Price: ${:.2f}".format(self.price) +
              "\nDiscount Percentage: " + str(self.discount_percent) + "%" +
              "\nDiscount Amount: ${:.2f}".format(self.get_discount_amount()) +
              "\nDiscounted Price: ${:.2f}".format(self.get_discount_price()))


""" Polymorphic class Movie, that IS A product """
class Movie(Product):
    def __init__(self, name, year, price, discount_percent):
        super().__init__(name, price, discount_percent)
        self.year = year

    """ Polymorphic Printing Description of a Movie """
    def print_description(self):
        print("\nMovie Title: " + str(self.name) +
              "\nRelease Year: " + str(self.year) +
              "\nOriginal Price: ${:.2f}".format(self.price) +
              "\nDiscount Percentage: " + str(self.discount_percent) + "%" +
              "\nDiscount Amount: ${:.2f}".format(self.get_discount_amount()) +
              "\nDiscounted Price: ${:.2f}".format(self.get_discount_price()))


print("\nCreating a product then printing")
p = Product("iPhone", 999.99, 5)
p.print_description()

print("\n\nCreating a product that is a book then printing")
b = Book("The Wheel of Time", "Robert Jordan", 19.99, 25)
b.print_description()

print("\n\nCreating a product that is a movie then printing")
m = Movie("Gladiator", 2000, 19.99, 75)
m.print_description()

