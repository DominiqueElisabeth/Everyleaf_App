require 'rails_helper'
RSpec.describe 'Label management function', type: :system do
  describe 'New creation function' do
    before do
      @user = FactoryBot.create(:user)
      @label = FactoryBot.create(:label)
      @label2 = FactoryBot.create(:label2)
    end
    context 'When creating a new task' do
      it 'Multiple labels can be registered with it' do
        visit new_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        task = FactoryBot.create(:task, name: 'task1', priority: "high", user_id: @user.id)
        labellin1 = FactoryBot.create(:labelling, label_id: @label.id , task_id: task.id)
        labellin2 = FactoryBot.create(:labelling, label_id: @label2.id , task_id: task.id)
        visit tasks_path
        expect(page).to have_content 'task1'
      end
    end
    context 'When going on the task details screen' do
      it 'Output the list of labels associated with the task' do
        visit new_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        task = FactoryBot.create(:task, name: 'task1', priority: "high", user_id: @user.id)
        labellin1 = FactoryBot.create(:labelling, label_id: @label.id , task_id: task.id)
        labellin2 = FactoryBot.create(:labelling, label_id: @label2.id , task_id: task.id)
        visit task_path(task.id)
        expect(page).to have_content 'Label 1'
        expect(page).to have_content 'Label 2'
      end
    end
    context 'When you search for label' do
      it "Tasks contain the labels are narrowed down" do
        visit new_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        label_search = "Label 1"
        visit tasks_path(label_id: @label.id)
        expect(page).to have_content label_search
      end
    end
  end
end
