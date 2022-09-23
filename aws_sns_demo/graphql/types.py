from email.policy import default
import graphene

class CustomType(graphene.ObjectType):
    hello_a = graphene.String(default_value="Fuck")
    hello_b = graphene.String(default_value="You")

    @staticmethod
    def resolve_hello_a(root, info):
        return "Fuck"

    @staticmethod
    def resolve_hello_b(root, info):
        return "you"
