// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

contract TodoList {

    struct Task {
        string name;
        bool isComplete;
    }

    mapping(uint256 => Task) public tasks;

    uint256 tasksCount = 0;

    function createTask(string memory _name) external {
        tasksCount++;
        tasks[tasksCount] = Task(_name, false);
    }

    function updateTaskName(uint256 taskId, string memory name) external  {
        require(taskId > 0 && taskId <= tasksCount,"Invalid Task Id");
        tasks[taskId].name = name;
    }

    function updateTaskStatus(uint256 taskId, bool status) external {
        require(taskId > 0 && taskId <= tasksCount,"Invalid Task Id");
        tasks[taskId].isComplete = status;
    } 

    function autoUpdateTaskStatus(uint256 taskId) external {
        require(taskId > 0 && taskId <= tasksCount,"Invalid Task Id");
        tasks[taskId].isComplete = !tasks[taskId].isComplete;
    } 

    function getTask(uint256 taskId) external view returns (string memory, bool){
        require(taskId > 0 && taskId <= tasksCount,"Invalid Task Id");
        return (tasks[taskId].name, tasks[taskId].isComplete);
    }

    
}