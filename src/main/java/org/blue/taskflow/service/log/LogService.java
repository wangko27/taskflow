package org.blue.taskflow.service.log;

import org.blue.taskflow.domain.entity.log.OperateLog;

/**
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-11-5
 * Time: 11:06:29
 */
public interface LogService {

    /**
     * �����ݿ������Ӳ�����¼
     *
     * @param operateLog ������¼
     */
    void operateLogging(OperateLog operateLog);
}
