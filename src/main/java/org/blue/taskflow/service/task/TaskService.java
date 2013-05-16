package org.blue.taskflow.service.task;

import org.blue.taskflow.domain.entity.task.Task;
import org.blue.taskflow.domain.entity.task.TaskStateLog;

import java.util.List;

/**
 * ����������ӿ�
 * <p/>
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-9-10
 * Time: 15:27:52
 */
public interface TaskService {

    /**
     * ��������
     *
     * @param task ����
     */
    void createTaskOperate(Task task);

    /**
     * ��������
     *
     * @param task ����
     */
    void assignTaskOperate(Task task);

    /**
     * ��������
     *
     * @param task ����
     */
    void acceptTaskOperate(Task task);

    /**
     * �ܾ�����
     *
     * @param task ����
     */
    void refuseTaskOperate(Task task);

    /**
     * �������
     *
     * @param task ����
     */
    void completeTaskOperate(Task task);

    /**
     * ��������
     *
     * @param task ����
     */
    void postponeTaskOperate(Task task);

    /**
     * �ر�����
     *
     * @param task ����
     */
    void closedTaskOperate(Task task);

    /**
     * �������״̬��־
     *
     * @param taskStateLog ����״̬��־
     */
    void taskStateLogging(TaskStateLog taskStateLog);

    /**
     * ��ȡ����ͨ������ID
     *
     * @param id ����ID
     * @return ����
     */
    Task getTask(Long id);

    /**
     * ɾ������
     *
     * @param id ����ID
     */
    void deleteTask(Long id);

    /**
     * ��ѯ�ҵ�����
     *
     * @param employeeId ְԱID
     * @return ���񼯺�
     */
    List<Task> queryMyTasks(Long employeeId);

    /**
     * ��ѯ����״̬��־
     *
     * @param taskId ����ID
     * @return ����״̬��־����
     */
    List<TaskStateLog> queryTaskStateLogs(Long taskId);
}
