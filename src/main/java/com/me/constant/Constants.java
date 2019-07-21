package com.me.constant;

/**
 * Created by Me on 2019/7/11.
 */
public class Constants {

    /**
     * 牌桌状态
     */
    public interface TableStatus {
        String VACANCY = "Vacancy"; // 空置
        String IN_SERVICE = "InService"; // 服务中
        String DELETED = "Deleted"; // 被删除
    }

    /**
     * 订单状态
     */
    public interface OrderStatus {
        String IN_PROGRESS = "InProgress"; // 进行中
        String OVER = "Over"; // 完结
        String CANCEL = "Cancel"; // 取消
    }
}
