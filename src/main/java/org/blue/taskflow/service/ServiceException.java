package org.blue.taskflow.service;

/**
 * Service�㹫�õ�Exception.
 *
 * �̳���RuntimeException, ����Spring��������ĺ������׳�ʱ�ᴥ������ع�.
 *
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-8-27
 * Time: 11:06:13
 */
public class ServiceException extends RuntimeException {

	public ServiceException() {
		super();
	}

	public ServiceException(String message) {
		super(message);
	}

	public ServiceException(Throwable cause) {
		super(cause);
	}

	public ServiceException(String message, Throwable cause) {
		super(message, cause);
	}
}
