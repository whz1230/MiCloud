package com.mi.singleton;

/**
 * @Description 任务管理器
 * @author wuhz
 * @date 2017-6-13 上午9:59:39
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
	 * ��ʾ���
	 */
	public void displayProcesses() {

	}

	/**
	 * ��ʾ����
	 */
	public void displayServices() {

	}
}
