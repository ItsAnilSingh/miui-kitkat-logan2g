.class public Lcom/android/internal/telephony/SamsungLogan2GRIL;
.super Lcom/android/internal/telephony/SamsungSPRDRIL;
.source "SamsungLogan2GRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 2
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    .line 62
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/SamsungSPRDRIL;-><init>(Landroid/content/Context;II)V

    .line 63
    const-string v0, "ro.ril.telephony.mqanelements"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/internal/telephony/SamsungLogan2GRIL;->mQANElements:I

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 2
    .parameter "context"
    .parameter "preferredNetworkType"
    .parameter "cdmaSubscription"
    .parameter "instanceId"

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/SamsungSPRDRIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 57
    const-string v0, "ro.ril.telephony.mqanelements"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/internal/telephony/SamsungLogan2GRIL;->mQANElements:I

    .line 58
    return-void
.end method

.method private responseUSSDStrings(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 10
    .parameter "p"

    .prologue
    const/4 v8, 0x2

    const/4 v9, 0x1

    .line 142
    const-string v6, "RILJ"

    const-string v7, "UNSOL_ON_USSD!"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    invoke-virtual {p1}, Landroid/os/Parcel;->readStringArray()[Ljava/lang/String;

    move-result-object v4

    .line 144
    .local v4, response:[Ljava/lang/String;
    array-length v6, v4

    if-le v6, v8, :cond_0

    .line 145
    aget-object v6, v4, v8

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 146
    .local v3, num:I
    const/16 v6, 0xf

    if-ne v3, v6, :cond_1

    .line 147
    aget-object v6, v4, v9

    invoke-static {v6}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 148
    .local v1, dataUssd:[B
    const/4 v6, 0x0

    array-length v7, v1

    invoke-static {v1, v6, v7}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BII)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v9

    .line 164
    .end local v1           #dataUssd:[B
    .end local v3           #num:I
    :cond_0
    :goto_0
    return-object v4

    .line 151
    .restart local v3       #num:I
    :cond_1
    const/16 v6, 0x48

    if-ne v3, v6, :cond_0

    .line 152
    aget-object v6, v4, v9

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    new-array v0, v6, [B

    .line 153
    .local v0, bytes:[B
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    aget-object v6, v4, v9

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_2

    .line 154
    div-int/lit8 v6, v2, 0x2

    aget-object v7, v4, v9

    add-int/lit8 v8, v2, 0x2

    invoke-virtual {v7, v2, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x10

    invoke-static {v7, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    int-to-byte v7, v7

    aput-byte v7, v0, v6

    .line 153
    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 157
    :cond_2
    :try_start_0
    new-instance v5, Ljava/lang/String;

    const-string v6, "UTF-16"

    invoke-direct {v5, v0, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 158
    .local v5, utfString:Ljava/lang/String;
    const/4 v6, 0x1

    aput-object v5, v4, v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 160
    .end local v5           #utfString:Ljava/lang/String;
    :catch_0
    move-exception v6

    goto :goto_0
.end method


# virtual methods
.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 10
    .parameter "p"

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 95
    .local v1, dataPosition:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 97
    .local v4, response:I
    sparse-switch v4, :sswitch_data_0

    .line 133
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 136
    invoke-super {p0, p1}, Lcom/android/internal/telephony/SamsungSPRDRIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 98
    :sswitch_0
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->responseUSSDStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v5

    .local v5, ret:Ljava/lang/Object;
    move-object v6, v5

    .line 99
    check-cast v6, [Ljava/lang/String;

    move-object v3, v6

    check-cast v3, [Ljava/lang/String;

    .line 101
    .local v3, resp:[Ljava/lang/String;
    array-length v6, v3

    if-ge v6, v9, :cond_1

    .line 102
    new-array v3, v9, [Ljava/lang/String;

    move-object v6, v5

    .line 103
    check-cast v6, [Ljava/lang/String;

    check-cast v6, [Ljava/lang/String;

    aget-object v6, v6, v7

    aput-object v6, v3, v7

    .line 104
    const/4 v6, 0x1

    aput-object v8, v3, v6

    .line 106
    :cond_1
    aget-object v6, v3, v7

    invoke-virtual {p0, v4, v6}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->unsljLogMore(ILjava/lang/String;)V

    .line 107
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungLogan2GRIL;->mUSSDRegistrant:Landroid/os/Registrant;

    if-eqz v6, :cond_0

    .line 108
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungLogan2GRIL;->mUSSDRegistrant:Landroid/os/Registrant;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 114
    .end local v3           #resp:[Ljava/lang/String;
    .end local v5           #ret:Ljava/lang/Object;
    :sswitch_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v5

    .restart local v5       #ret:Ljava/lang/Object;
    move-object v0, v5

    .line 115
    check-cast v0, Ljava/lang/String;

    .line 116
    .local v0, amString:Ljava/lang/String;
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Executing AM: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "am "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 120
    :catch_0
    move-exception v2

    .line 121
    .local v2, e:Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 122
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "am "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " could not be executed."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 126
    .end local v0           #amString:Ljava/lang/String;
    .end local v2           #e:Ljava/io/IOException;
    .end local v5           #ret:Ljava/lang/Object;
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v5

    .line 127
    .restart local v5       #ret:Ljava/lang/Object;
    goto/16 :goto_0

    .line 129
    .end local v5           #ret:Ljava/lang/Object;
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v5

    .line 130
    .restart local v5       #ret:Ljava/lang/Object;
    goto/16 :goto_0

    .line 97
    :sswitch_data_0
    .sparse-switch
        0x3ee -> :sswitch_0
        0x40c -> :sswitch_3
        0x2b02 -> :sswitch_1
        0x2b0d -> :sswitch_2
    .end sparse-switch
.end method

.method public sendUSSD(Ljava/lang/String;Landroid/os/Message;)V
    .locals 6
    .parameter "ussdString"
    .parameter "response"

    .prologue
    .line 75
    const/16 v4, 0x1d

    invoke-static {v4, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    .line 78
    .local v1, rr:Lcom/android/internal/telephony/RILRequest;
    const/4 v3, 0x0

    .line 80
    .local v3, ussdByte:[B
    :try_start_0
    invoke-static {p1}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 84
    :goto_0
    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, sendData:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "USSD sendData = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->riljLog(Ljava/lang/String;)V

    .line 86
    iget-object v4, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 88
    return-void

    .line 81
    .end local v2           #sendData:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 82
    .local v0, e:Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception e = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/SamsungLogan2GRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setNetworkSelectionModeAutomatic(Landroid/os/Message;)V
    .locals 0
    .parameter "response"

    .prologue
    .line 70
    return-void
.end method
