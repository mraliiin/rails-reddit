require 'rails_helper'

RSpec.describe User, type: :model do
    context 'Associations' do
        it 'has many posts' do
            association = described_class.reflect_on_association(:posts)
            expect(association.macro).to eq :has_many
        end

        it 'has_many group_messages' do 
            association = described_class.reflect_on_association(:group_messages)
            expect(association.macro).to eq :has_many
            expect(association.options[:class_name]).to eq 'Group::Message'
        end
        
        it 'has_and_belongs_to_many group_conversations' do
            association = described_class.reflect_on_association(:group_conversations)
            expect(association.macro).to eq :has_and_belongs_to_many
            expect(association.options[:class_name]).to eq 'Group::Conversation'
        end
    end
end