
//
//  UnitTestDemoUITests.swift
//  UnitTestDemoUITests
//
//  Created by Thongchai Subsaidee on 13/9/2564 BE.
//

import XCTest

class Setup_launching_add_new_task_screen: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
        let addTaskButton = app.buttons["showAddTaskButton"]
        addTaskButton.tap()
    }
    
}

class When_add_new_task_screen_is_presented: Setup_launching_add_new_task_screen {
    
    
    func test_should_make_sure_screen_is_displayed() {
        let addTaskNavBarTitle = app.staticTexts["Add Task"]
        XCTAssert(addTaskNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func test_should_make_sure_all_required_controls_are_persent() {
        XCTAssertTrue(app.textFields["addTaskTextField"].exists)
        XCTAssertTrue(app.buttons["showAddTaskButton"].exists)
    }
    
    func test_should_dismiss_modal_after_adding_new_task() {
        let taskTextField = app.textFields["addTaskTextField"]
        taskTextField.tap()
        taskTextField.typeText("Wash the car")
        
        let addTaskButton = app.buttons["addTaskButton"]
        addTaskButton.tap()
        
        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 0.5))
    }
    
}

class When_adding_new_task: Setup_launching_add_new_task_screen {
    
    func test_should_display_new_task_in_the_list() {
        let taskTextField = app.textFields["addTaskTextField"]
        taskTextField.tap()
        taskTextField.typeText("Wash car")
        
        let addTaskButton = app.buttons["addTaskButton"]
        addTaskButton.tap()
        
        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 0.5))
        
        let taskList = app.tables["taskList"]
        let _ = taskList.waitForExistence(timeout: 0.5)
        
        let totalTaskItems = taskList.descendants(matching: .staticText).count
        XCTAssertEqual(1, totalTaskItems)
    }
    
}
