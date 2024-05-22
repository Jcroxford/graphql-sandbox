module Types
  class EditAuthorAttributesType < Types::BaseInputObject
    description("Sometimes people change. Can you imagine?")

    argument(:name, String, required: true)
  end
end