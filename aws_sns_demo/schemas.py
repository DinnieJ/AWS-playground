import graphene
from aws_sns_demo.graphql.types import CustomType

class SNSDemoQueries(graphene.ObjectType):
    aws_hello = graphene.String(default_value="Hi from sns demo!")
    aws_field = graphene.Field(type=CustomType)
