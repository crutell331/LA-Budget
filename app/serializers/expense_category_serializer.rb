class ExpenseCategorySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :expense
  belongs_to :category
end