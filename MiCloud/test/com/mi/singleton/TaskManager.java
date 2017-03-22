package com.mi.singleton;

/**
 * @Description ���������
 * @author whz
 * @date 2017-2-22 ����3:13:23
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
	 * ��ʾ����
	 */
	public void displayProcesses() {

	}

	/**
	 * ��ʾ����
	 */
	public void displayServices() {

	}
}
