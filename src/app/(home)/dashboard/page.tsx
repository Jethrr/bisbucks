"use client";
import Navbar from "@/components/ui/Navbar";
import { authClient } from "@/lib/auth-client";
import React from "react";
import { Button } from "@/components/ui/button";
import { Plus } from "lucide-react";
import { useState } from "react";
import { TransactionCard } from "@/components/transaction-card";
import { FeedChart } from "@/components/feed-chart";

interface CardProps {
  title: string;
  value: number;
  image: string;
}

const Feed = () => {
  const { data } = authClient.useSession();
  const [isOpen, setIsOpen] = useState<boolean>(false);
  const transactype = ["Expenses", "Income"];

  if (!data) {
    return <div>Loading...</div>;
  }

  const toggleCard = () => {
    setIsOpen(!isOpen);
  };

  const handleSubmit = () => {
    console.log("Project deployed!");
  };

  const handleCancel = () => {
    setIsOpen(false);
  };

  return (
    <section className="main-container mx-auto">
      <div className="main-header px-12 p-8 flex justify-between items-center">
        <h1 className="text-3xl font-bold  ">Hello! {data.user.name} 👋</h1>
        <Button onClick={toggleCard} variant="default">
          <Plus /> New Transaction
        </Button>
      </div>
      {isOpen && (
        <TransactionCard
          title="New transaction"
          description="Add your new transaction details"
          buttonText="Add"
          onSubmit={handleSubmit}
          onCancel={handleCancel}
          frameworks={transactype}
        />
      )}

      <div className="tab px-12 py-5">
        <div className="tab-content flex items-center justify-between gap-3">
          <CardChoice title="Income" value={1000} image="increase.png" />
          <CardChoice title=" Expenses" value={2000} image="decrease.png" />
          <CardChoice title="Balance" value={1000} image="wallet.png" />
        </div>
      </div>

      <div className="chart px-12 flex items-center gap-3">
        <FeedChart />
        <div className="recent-div border">
          <h1 className="font-bold text-xl">Recent Transactions</h1>
        </div>
      </div>
    </section>
  );
};

const CardChoice = ({ title, value, image }: CardProps) => {
  return (
    <div className="flex-col items-center card gap-3 p-5 bg-gray-50 w-full h-28 rounded-lg  border ">
      <h1 className="font-bold text-sm ">{title}</h1>
      <div className="flex items-center gap-3 pt-1">
        <div className="icon-div  border-black rounded p-1">
          <img className="w-8 h-7" src={image} alt="" />
        </div>
        <div className="content-div flex flex-col ">
          <h1 className="text-3xl font-bold">₱{value}</h1>
        </div>
      </div>
    </div>
  );
};

export default Feed;
