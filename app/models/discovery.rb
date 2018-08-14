class Discovery < ApplicationRecord
    has_many :dcomments, dependent: :destroy

    paginates_per 10
end
