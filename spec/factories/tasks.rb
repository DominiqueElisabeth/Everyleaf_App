 FactoryBot.define do

    factory :task do
      name { 'task1' }
      description { 'description1' }
      status { 'Completed' }
      deadline { DateTime.now }
    end

    factory :second_task, class: Task do
      name { 'task2' }
      description { 'description2' }
      status { 'Not started' }
      deadline { DateTime.tomorrow }

    end
end
