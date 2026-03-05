#set page(paper: "a4")
#set heading(numbering: "1.")

#show link: set text(fill: blue, weight: 700)
#show link: underline

#set document(
  title: [COS568 HW2 Report],
  author: "Carter Costic",
  date: datetime(year: 2026, month: 3, day: 5),
)

#align(center)[
  #text(size: 18pt, weight: "bold")[COS 568: Homework 2] \
  #v(0.3em)
  Carter Costic \
  Professor Li \
  March x, 2026
]

= Fine-tuning BERT on GLUE Datasets

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    table.header[*Epoch*][*Accuracy (%)*][*Training Time (s)*],
    [1], [62.82], [129.20],
    [2], [64.98], [110.99],
    [3], [62.09], [110.83],
  ),
  caption: [Evaluation accuracy (%) fine-tuning BERT over 3 epochs.],
)

= Distributed Data Parallel Training

== Gradient Synchronization with gather and scatter 

== Gradient Synchronization with all_reduce

= Distributed Data Parallel Training with PyTorch DistributedDataParallel

= Benchmarking Data Parallel Training