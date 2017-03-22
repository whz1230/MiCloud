package com.mi.singleton;

/**
 * @Description 任务管理器
 * @author whz
 * @date 2017-2-22 下午3:13:23
 */
public class TaskManager {

	private static TaskManager instance = null;

	private TaskManager() {
	}

	public static TaskManager getInstance() {
		if (instance == null) {
			instance = new TaskManager();
		}

		return instance;
	}

	/**
	 * 显示进程
	 */
	public void displayProcesses() {

	}

	/**
	 * 显示服务
	 */
	public void displayServices() {

	}
}
