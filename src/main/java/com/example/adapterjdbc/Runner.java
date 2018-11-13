package com.example.adapterjdbc;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.channel.PublishSubscribeChannel;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class Runner implements CommandLineRunner {

    /**
     * 点对点通道, 一次只有一个消息接受者能够接收消息, 单播
     *
     * DirectChannel 是一个 SubscribableChannel, 其特点是如果多个订阅者订阅 SubscribableChannel, 对于每一个
     * 通道中的消息, DirectChannel 默认通过轮询的方式发送消息给订阅者处理.
     * <p>
     * 可以使用 DirectChannel 来做负载均衡
     */
    private DirectChannel channelResultSet;

    private PublishSubscribeChannel publishSubscribeChannel;

    @Autowired
    public void setChannelResultSet(DirectChannel channelResultSet) {
        this.channelResultSet = channelResultSet;
    }

    @Autowired
    public void setPublishSubscribeChannel(PublishSubscribeChannel publishSubscribeChannel) {
        this.publishSubscribeChannel = publishSubscribeChannel;
    }

    @Override
    public void run(String... args) throws Exception {

        // 单播通道
        channelResultSet.subscribe(new DefaultMessageHandler("一次只有一个接受者,在多个接受者之间进行轮询 A"));
        channelResultSet.subscribe(new DefaultMessageHandler("一次只有一个接受者,在多个接受者之间进行轮询 B"));
        channelResultSet.subscribe(new DefaultMessageHandler("一次只有一个接受者,在多个接受者之间进行轮询 C"));
        // 广播通道
        publishSubscribeChannel.subscribe(new DefaultMessageHandler("广播给每一个订阅者 AAA"));
        publishSubscribeChannel.subscribe(new DefaultMessageHandler("广播给每一个订阅者 BBB"));
        publishSubscribeChannel.subscribe(new DefaultMessageHandler("广播给每一个订阅者 CCC"));
    }
}
