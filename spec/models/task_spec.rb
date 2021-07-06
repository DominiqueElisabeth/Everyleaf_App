 require 'rails_helper'
RSpec.describe Task, type: :model do
  before do
    FactoryBot.create(:user, name: 'ange',
                             email: 'ange@gmail.com',
                             password: 'password',
                             password_confirmation: 'password')
    visit new_session_path
    fill_in 'email', with: 'ange@gmail.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    @user = User.first
    FactoryBot.create(:task, name: "name1", description: "content1", deadline: "2021/1/1", status:"Complete", priority: "Low", user_id: @user.id)
    FactoryBot.create(:task, name: "name2", description: "content2", deadline: "2021/1/1", status:"Complete", priority: "Low", user_id: @user.id)
    FactoryBot.create(:task, name: "name3", description: "content3", deadline: "2021/1/1", status:"Complete", priority: "Low", user_id: @user.id)
    end

 describe 'Validation test' do
   context 'If the task name is empty' do
     it 'The task cannot be validated' do
       task = Task.new(name: '', description: 'Failure test')
       expect(task).not_to be_valid
     end
   end

   context 'If the task details are empty' do
     it 'The task cannot be validated' do
       task = Task.new(name: 'Task', description: '')
       expect(task).not_to be_valid
     end
   end
   context 'If the task name and details are described' do
     it 'The task can be validated' do
        @user = FactoryBot.create(:user)
        task = FactoryBot.create(:task, user: @user)
        expect(task).to be_valid
      end
    end
  end

 #Step3
 describe 'Search Function' do
   let!(:task) { FactoryBot.create(:task) }
   let!(:second_task) { FactoryBot.create(:second_task) }
   context 'Title is performed by scope method' do
     it "Tasks containing search keywords are narrowed down" do
       expect(Task.name_search('task1')).to include(task)
       expect(Task.name_search('task1')).not_to include(second_task)
       expect(Task.name_search('task1').count).to eq 1
     end
   end

   context 'When the status is searched with the scope method' do
     it "Tasks that exactly match the status are narrowed down" do
       expect(Task.status_search('Completed')).to include(task)
       expect(Task.status_search('Completed')).not_to include(second_task)
       expect(Task.status_search('Completed').count).to eq 1
     end
   end

   context 'When performing fuzzy search and status search Title' do
         it "Narrow down tasks that include search keywords in the Title and exactly match the status" do
           expect(Task.name_search('task1').status_search('Completed')).to include(task)
           expect(Task.name_search('task1').status_search('Completed')).not_to include(second_task)
           expect(Task.name_search('task1').status_search('Completed').count).to eq 1

         end
       end
     end
   end
