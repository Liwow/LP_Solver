# from paddlespeech.cli.asr.infer import ASRExecutor
# from paddlespeech.cli.asr.infer import ASRExecutor
# import csv
# import moviepy.editor as mp
# import auditok
# import os
# import paddle
# from paddlespeech.cli import ASRExecutor, TextExecutor
# import soundfile
# import librosa
# import warnings
# import csv
#
# warnings.filterwarnings('ignore')
#
#
# # pip install paddlespeech
# # pip install auditok
#
# def sigment(path, ty='audio', mmin_dur=1, mmax_dur=100000, mmax_silence=1, menergy_threshold=55):
#     audio_file = path
#     audio, audio_sample_rate = soundfile.read(
#         audio_file, dtype="int16", always_2d=True)
#
#     audio_regions = auditok.split(
#         audio_file,
#         min_dur=mmin_dur,  # minimum duration of a valid audio event in seconds
#         max_dur=mmax_dur,  # maximum duration of an event
#         # maximum duration of tolerated continuous silence within an event
#         max_silence=mmax_silence,
#         energy_threshold=menergy_threshold  # threshold of detection
#     )
#
#     for i, r in enumerate(audio_regions):
#         # Regions returned by `split` have 'start' and 'end' metadata fields
#         print(
#             "Region {i}: {r.meta.start:.3f}s -- {r.meta.end:.3f}s".format(i=i, r=r))
#
#         epath = ''
#         file_pre = str(epath.join(audio_file.split('.')[0].split('/')[-1]))
#
#         mk = 'change'
#         if (os.path.exists(mk) == False):
#             os.mkdir(mk)
#         if (os.path.exists(mk + '/' + ty) == False):
#             os.mkdir(mk + '/' + ty)
#         if (os.path.exists(mk + '/' + ty + '/' + file_pre) == False):
#             os.mkdir(mk + '/' + ty + '/' + file_pre)
#         num = i
#         # 为了取前三位数字排序
#         s = '000000' + str(num)
#
#         file_save = mk + '/' + ty + '/' + file_pre + '/' + \
#                     s[-3:] + '-' + '{meta.start:.3f}-{meta.end:.3f}' + '.wav'
#         filename = r.save(file_save)
#         print("region saved as: {}".format(filename))
#     return mk + '/' + ty + '/' + file_pre
#
#
# def delete_file(file_path):
#     if os.path.exists(file_path):
#         os.remove(file_path)
#         print(f"文件 {file_path} 已删除")
#     else:
#         print(f"文件 {file_path} 不存在")
#
#
# asr_executor = ASRExecutor()
#
#
# def audio2txt(path):
#     # 返回path下所有文件构成的一个list列表
#     print(f"path: {path}")
#     filelist = os.listdir(path)
#     # 保证读取按照文件的顺序
#     filelist.sort(key=lambda x: int(os.path.splitext(x)[0][:3]))
#     # 遍历输出每一个文件的名字和类型
#     words = []
#     for file in filelist:
#         print(path + '/' + file)
#         text = asr_executor(
#             audio_file=path + '/' + file,
#             device=paddle.get_device(), force_yes=True)  # force_yes参数需要注意
#         words.append(text)
#     return words
#
#
# def txt2csv(txt_all):
#     with open('result.csv', 'w', encoding='utf-8') as f:
#         f_csv = csv.writer(f)
#         for row in txt_all:
#             f_csv.writerow([row])
#
#
# # audio_file = 'XXX.wav'
# # paddleaudio.load(audio_file, sr=None, mono=True, normal=False)
# # asr = ASRExecutor()
# # result = asr(audio_file="zh.wav")
#
# def main(url):
#     # 可替换成自身的录音文件
#     source_path = url
#     # 划分音频
#     path = sigment(path=source_path, ty='audio',
#                    mmin_dur=0.5, mmax_dur=100000, mmax_silence=0.5, menergy_threshold=55)
#     # 音频转文本  需要GPU
#     txt_all = audio2txt(path)
#     # texts = ''.join(txt_all)
#
#     # 存入csv
#     txt2csv(txt_all)
#
#     texts = ''
#     source_path = 'result.csv'
#     with open(source_path, 'r') as f:
#         text = f.readlines()
#     for i in range(len(text)):
#         text[i] = text[i].replace('\n', '')
#         texts = texts + text[i]
#     print(texts)
#
#     text_executor = TextExecutor()
#     if text:
#         res = text_executor(
#             text=texts,
#             task='punc',
#             model='ernie_linear_p3_wudao',
#             device=paddle.get_device(),
#             # force_yes=True
#         )
#     delete_file(source_path)
#     print(res)
#     return res
#
#
# if __name__ == '__main__':
#     url = 'https://aip.baidubce.com/rpc/2.0/speech/v1/asr'
#     res = main(url)
