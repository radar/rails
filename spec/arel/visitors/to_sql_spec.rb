require 'spec_helper'

module Arel
  module Visitors
    describe 'the to_sql visitor' do
      before do
        @visitor = ToSql.new Table.engine
        @attr = Table.new(:users)[:id]
      end

      it "should visit visit_Arel_Attributes_Time" do
        attr = Attributes::Time.new(@attr.relation, @attr.name, @attr.column)
        @visitor.accept attr
      end

      describe 'Equality' do
        it "should escape strings" do
          test = @attr.eq 'Aaron Patterson'
          @visitor.accept(test).should be_like %{
            "users"."id" = 'Aaron Patterson'
          }
        end
      end
    end
  end
end
