class SearchesController < ApplicationController

    def character
        groupings = []

        

        @query = Character.ransack(
            combinator: 'and',
            groupings: groupings
        )

        @characters = @query.result(distinct: true)

    end
end
