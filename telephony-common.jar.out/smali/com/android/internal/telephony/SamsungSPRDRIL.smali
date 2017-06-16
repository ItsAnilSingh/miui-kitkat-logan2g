.class public Lcom/android/internal/telephony/SamsungSPRDRIL;
.super Lcom/android/internal/telephony/RIL;
.source "SamsungSPRDRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/SamsungSPRDRIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 1
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"
    .parameter "instanceId"

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 47
    const/4 v0, 0x6

    iput v0, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mQANElements:I

    .line 48
    return-void
.end method

.method private invokeOemRilRequestSprd(BBLandroid/os/Message;)V
    .locals 3
    .parameter "key"
    .parameter "value"
    .parameter "response"

    .prologue
    .line 126
    const/4 v0, 0x6

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/16 v2, 0x53

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    const/16 v2, 0x50

    aput-byte v2, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0x52

    aput-byte v2, v0, v1

    const/4 v1, 0x3

    const/16 v2, 0x44

    aput-byte v2, v0, v1

    const/4 v1, 0x4

    aput-byte p1, v0, v1

    const/4 v1, 0x5

    aput-byte p2, v0, v1

    invoke-virtual {p0, v0, p3}, Lcom/android/internal/telephony/SamsungSPRDRIL;->invokeOemRilRequestRaw([BLandroid/os/Message;)V

    .line 127
    return-void
.end method


# virtual methods
.method public dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V
    .locals 5
    .parameter "address"
    .parameter "clirMode"
    .parameter "uusInfo"
    .parameter "result"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 52
    const/16 v1, 0xa

    invoke-static {v1, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 54
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 55
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 56
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 57
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 58
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 60
    if-nez p3, :cond_0

    .line 61
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SamsungSPRDRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->riljLog(Ljava/lang/String;)V

    .line 71
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungSPRDRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 72
    return-void

    .line 63
    :cond_0
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 64
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 65
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 66
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_0
.end method

.method protected notifyRegistrantsRilConnectionChanged(I)V
    .locals 3
    .parameter "rilVer"

    .prologue
    const/4 v2, 0x0

    .line 113
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->notifyRegistrantsRilConnectionChanged(I)V

    .line 114
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mInstanceId:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 116
    const-string v0, "Enable simultaneous data/voice on Multi-SIM"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungSPRDRIL;->riljLog(Ljava/lang/String;)V

    .line 117
    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/android/internal/telephony/SamsungSPRDRIL;->invokeOemRilRequestSprd(BBLandroid/os/Message;)V

    .line 123
    :cond_0
    :goto_0
    return-void

    .line 120
    :cond_1
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/SamsungSPRDRIL;->setDataSubscription(Landroid/os/Message;)V

    goto :goto_0
.end method

.method protected processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;
    .locals 9
    .parameter "p"

    .prologue
    const/4 v5, 0x0

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 134
    .local v3, serial:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 138
    .local v0, error:I
    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/SamsungSPRDRIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v2

    .line 140
    .local v2, rr:Lcom/android/internal/telephony/RILRequest;
    if-nez v2, :cond_1

    .line 141
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected solicited response! sn: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v5

    .line 326
    .end local v2           #rr:Lcom/android/internal/telephony/RILRequest;
    :cond_0
    :goto_0
    return-object v2

    .line 146
    .restart local v2       #rr:Lcom/android/internal/telephony/RILRequest;
    :cond_1
    const/4 v1, 0x0

    .line 148
    .local v1, ret:Ljava/lang/Object;
    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v6

    if-lez v6, :cond_3

    .line 150
    :cond_2
    :try_start_0
    iget v6, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v6, :pswitch_data_0

    .line 274
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unrecognized solicited response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    :catch_0
    move-exception v4

    .line 279
    .local v4, tr:Ljava/lang/Throwable;
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "< "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v8}, Lcom/android/internal/telephony/SamsungSPRDRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " exception, possible invalid RIL response"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v4}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 283
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_0

    .line 284
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v5, v4}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 285
    iget-object v5, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 156
    .end local v4           #tr:Ljava/lang/Throwable;
    :pswitch_0
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 295
    .end local v1           #ret:Ljava/lang/Object;
    :cond_3
    :goto_1
    iget v6, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v6, :sswitch_data_0

    .line 313
    :cond_4
    :goto_2
    if-eqz v0, :cond_6

    .line 314
    invoke-virtual {v2, v0, v1}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    goto :goto_0

    .line 157
    .restart local v1       #ret:Ljava/lang/Object;
    :pswitch_1
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 158
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 159
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 160
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 161
    :pswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 162
    :pswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 163
    :pswitch_7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 164
    :pswitch_8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 165
    :pswitch_9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 166
    :pswitch_a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 167
    :pswitch_b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 168
    :pswitch_c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 170
    :pswitch_d
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 171
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    if-eqz v6, :cond_5

    .line 172
    const-string v6, "testing emergency call, notify ECM Registrants"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SamsungSPRDRIL;->riljLog(Ljava/lang/String;)V

    .line 173
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    invoke-virtual {v6}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 176
    :cond_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    .line 177
    goto :goto_1

    .line 179
    :pswitch_e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 180
    :pswitch_f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 181
    :pswitch_10
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 182
    :pswitch_11
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 183
    :pswitch_12
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 184
    :pswitch_13
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 185
    :pswitch_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 186
    :pswitch_15
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 187
    :pswitch_16
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 188
    :pswitch_17
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 189
    :pswitch_18
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 190
    :pswitch_19
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 191
    :pswitch_1a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 192
    :pswitch_1b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 193
    :pswitch_1c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 194
    :pswitch_1d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 195
    :pswitch_1e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 196
    :pswitch_1f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 197
    :pswitch_20
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseCallForward(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 198
    :pswitch_21
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 199
    :pswitch_22
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 200
    :pswitch_23
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 201
    :pswitch_24
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 202
    :pswitch_25
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 203
    :pswitch_26
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 204
    :pswitch_27
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 205
    :pswitch_28
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 206
    :pswitch_29
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 207
    :pswitch_2a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 208
    :pswitch_2b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 209
    :pswitch_2c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 210
    :pswitch_2d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 211
    :pswitch_2e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 212
    :pswitch_2f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 213
    :pswitch_30
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 214
    :pswitch_31
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 215
    :pswitch_32
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 216
    :pswitch_33
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 217
    :pswitch_34
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 218
    :pswitch_35
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 219
    :pswitch_36
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 220
    :pswitch_37
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 221
    :pswitch_38
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 222
    :pswitch_39
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 223
    :pswitch_3a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseRaw(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 224
    :pswitch_3b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 225
    :pswitch_3c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 226
    :pswitch_3d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 227
    :pswitch_3e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 228
    :pswitch_3f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 229
    :pswitch_40
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 230
    :pswitch_41
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 231
    :pswitch_42
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 232
    :pswitch_43
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 233
    :pswitch_44
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 234
    :pswitch_45
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 235
    :pswitch_46
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 236
    :pswitch_47
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 237
    :pswitch_48
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 238
    :pswitch_49
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseGetPreferredNetworkType(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 239
    :pswitch_4a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseCellList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 240
    :pswitch_4b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 241
    :pswitch_4c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 242
    :pswitch_4d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 243
    :pswitch_4e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 244
    :pswitch_4f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 245
    :pswitch_50
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 246
    :pswitch_51
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 247
    :pswitch_52
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 248
    :pswitch_53
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 249
    :pswitch_54
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 250
    :pswitch_55
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 251
    :pswitch_56
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 252
    :pswitch_57
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseGmsBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 253
    :pswitch_58
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 254
    :pswitch_59
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 255
    :pswitch_5a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseCdmaBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 256
    :pswitch_5b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 257
    :pswitch_5c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 258
    :pswitch_5d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 259
    :pswitch_5e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 260
    :pswitch_5f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 261
    :pswitch_60
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 262
    :pswitch_61
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 263
    :pswitch_62
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 264
    :pswitch_63
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 265
    :pswitch_64
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 266
    :pswitch_65
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 267
    :pswitch_66
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 268
    :pswitch_67
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 269
    :pswitch_68
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 270
    :pswitch_69
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 271
    :pswitch_6a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 272
    :pswitch_6b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v1

    goto/16 :goto_1

    .line 303
    .end local v1           #ret:Ljava/lang/Object;
    :sswitch_0
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_4

    .line 305
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ON enter sim puk fakeSimStatusChanged: reg count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v7}, Landroid/os/RegistrantList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SamsungSPRDRIL;->riljLog(Ljava/lang/String;)V

    .line 308
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v6}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto/16 :goto_2

    .line 318
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "< "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v7}, Lcom/android/internal/telephony/SamsungSPRDRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {p0, v7, v1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SamsungSPRDRIL;->riljLog(Ljava/lang/String;)V

    .line 321
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_0

    .line 322
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v1, v5}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 323
    iget-object v5, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 150
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_38
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
        :pswitch_3d
        :pswitch_3e
        :pswitch_3f
        :pswitch_40
        :pswitch_41
        :pswitch_42
        :pswitch_43
        :pswitch_44
        :pswitch_45
        :pswitch_46
        :pswitch_47
        :pswitch_48
        :pswitch_49
        :pswitch_4a
        :pswitch_4b
        :pswitch_4c
        :pswitch_4d
        :pswitch_4e
        :pswitch_4f
        :pswitch_50
        :pswitch_51
        :pswitch_52
        :pswitch_53
        :pswitch_54
        :pswitch_5d
        :pswitch_55
        :pswitch_56
        :pswitch_57
        :pswitch_58
        :pswitch_59
        :pswitch_5a
        :pswitch_5b
        :pswitch_5c
        :pswitch_5e
        :pswitch_5f
        :pswitch_60
        :pswitch_61
        :pswitch_64
        :pswitch_62
        :pswitch_63
        :pswitch_65
        :pswitch_66
        :pswitch_67
        :pswitch_68
        :pswitch_69
        :pswitch_6a
        :pswitch_6b
    .end packed-switch

    .line 295
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x3 -> :sswitch_0
        0x4 -> :sswitch_0
        0x5 -> :sswitch_0
        0x6 -> :sswitch_0
        0x7 -> :sswitch_0
        0x2b -> :sswitch_0
    .end sparse-switch
.end method

.method public setDataSubscription(Landroid/os/Message;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 100
    iget-object v1, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mInstanceId:Ljava/lang/Integer;

    if-nez v1, :cond_0

    const/4 v0, 0x0

    .line 101
    .local v0, simId:I
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting data subscription to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->riljLog(Ljava/lang/String;)V

    .line 102
    const/4 v1, 0x2

    new-array v1, v1, [B

    fill-array-data v1, :array_0

    invoke-virtual {p0, v1, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->invokeOemRilRequestRaw([BLandroid/os/Message;)V

    .line 103
    return-void

    .line 100
    .end local v0           #simId:I
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    .line 102
    :array_0
    .array-data 0x1
        0x9t
        0x4t
    .end array-data
.end method

.method public setDefaultVoiceSub(ILandroid/os/Message;)V
    .locals 2
    .parameter "subIndex"
    .parameter "response"

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p2, v0, v1}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 108
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 109
    return-void
.end method

.method public setUiccSubscription(IIIILandroid/os/Message;)V
    .locals 6
    .parameter "slotId"
    .parameter "appIndex"
    .parameter "subId"
    .parameter "subStatus"
    .parameter "result"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setUiccSubscription"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungSPRDRIL;->riljLog(Ljava/lang/String;)V

    .line 80
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p5, v0, v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 81
    invoke-virtual {p5}, Landroid/os/Message;->sendToTarget()V

    .line 84
    if-ne p4, v5, :cond_1

    .line 86
    iget-object v0, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    new-instance v1, Landroid/os/AsyncResult;

    new-array v2, v5, [I

    aput v5, v2, v4

    invoke-direct {v1, v3, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    .line 97
    :cond_0
    :goto_0
    return-void

    .line 90
    :cond_1
    if-nez p4, :cond_0

    .line 92
    iget-object v0, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/android/internal/telephony/SamsungSPRDRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    new-instance v1, Landroid/os/AsyncResult;

    new-array v2, v5, [I

    aput v4, v2, v4

    invoke-direct {v1, v3, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_0
.end method
