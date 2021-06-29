 require 'rails_helper'
RSpec.describe Task, type: :model do

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
       task = Task.new(
         name: 'task1',
         description: 'Hello',
         deadline: '2021/06/29',
         status: 'completed',
         priority: 'high' )
       expect(task).to be_valid
     end
   end
 end
end
