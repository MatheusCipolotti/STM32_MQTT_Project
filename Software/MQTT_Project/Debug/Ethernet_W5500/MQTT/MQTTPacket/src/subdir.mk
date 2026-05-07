################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectClient.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectServer.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTDeserializePublish.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTFormat.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTPacket.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSerializePublish.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeClient.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeServer.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.c \
../Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.c 

OBJS += \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectClient.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectServer.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTDeserializePublish.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTFormat.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTPacket.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSerializePublish.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeClient.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeServer.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.o \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.o 

C_DEPS += \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectClient.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectServer.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTDeserializePublish.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTFormat.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTPacket.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSerializePublish.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeClient.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeServer.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.d \
./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.d 


# Each subdirectory must supply rules for building sources it contributes
Ethernet_W5500/MQTT/MQTTPacket/src/%.o Ethernet_W5500/MQTT/MQTTPacket/src/%.su Ethernet_W5500/MQTT/MQTTPacket/src/%.cyclo: ../Ethernet_W5500/MQTT/MQTTPacket/src/%.c Ethernet_W5500/MQTT/MQTTPacket/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32G0 -DSTM32G0B0RETx -c -I../Inc -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Device -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Include -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500 -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT/MQTTPacket/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Ethernet_W5500-2f-MQTT-2f-MQTTPacket-2f-src

clean-Ethernet_W5500-2f-MQTT-2f-MQTTPacket-2f-src:
	-$(RM) ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectClient.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectClient.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectClient.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectClient.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectServer.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectServer.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectServer.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTConnectServer.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTDeserializePublish.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTDeserializePublish.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTDeserializePublish.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTDeserializePublish.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTFormat.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTFormat.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTFormat.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTFormat.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTPacket.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTPacket.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTPacket.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTPacket.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSerializePublish.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSerializePublish.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSerializePublish.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSerializePublish.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeClient.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeClient.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeClient.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeClient.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeServer.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeServer.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeServer.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTSubscribeServer.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeClient.su ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.cyclo ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.d ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.o ./Ethernet_W5500/MQTT/MQTTPacket/src/MQTTUnsubscribeServer.su

.PHONY: clean-Ethernet_W5500-2f-MQTT-2f-MQTTPacket-2f-src

