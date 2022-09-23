import imp
import graphene

from aws_sns_demo.schemas import SNSDemoQueries

class Query(graphene.ObjectType):
    hello = graphene.String(default_value="Hi!")

class RootSchema(Query, SNSDemoQueries):
    pass

schema = graphene.Schema(query=RootSchema)
