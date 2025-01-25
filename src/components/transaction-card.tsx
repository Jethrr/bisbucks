import * as React from "react";
import { motion } from "framer-motion";

import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

interface TransactionCardProps {
  title: string;
  description: string;
  buttonText: string;
  onSubmit: () => void;
  onCancel: () => void;
  frameworks: string[];
}

export function TransactionCard({
  title,
  description,
  buttonText,
  onSubmit,
  onCancel,
  frameworks,
}: TransactionCardProps) {
  return (
    <>
      {/* Static background with opacity */}
      <div className="fixed inset-0 bg-black bg-opacity-50 z-40"></div>

      {/* Animated popup content */}
      <motion.div
        initial={{ opacity: 0, scale: 0.8 }}
        animate={{ opacity: 1, scale: 1 }}
        exit={{ opacity: 0, scale: 0.8 }}
        transition={{ duration: 0.4, type: "spring", bounce: 0.5 }}
        className="fixed inset-0 flex justify-center items-center z-50"
      >
        <Card className="w-[350px] bg-white shadow-lg rounded-lg">
          <CardHeader>
            <CardTitle>{title}</CardTitle>
            <CardDescription>{description}</CardDescription>
          </CardHeader>
          <CardContent>
            <form>
              <div className="grid w-full items-center gap-4">
                <div className="flex flex-col space-y-1.5">
                  <Label htmlFor="name">Amount</Label>
                  <Input id="name" placeholder="0.00" />
                </div>
                <div className="flex flex-col space-y-1.5">
                  <Label htmlFor="framework">Transaction Type</Label>
                  <Select>
                    <SelectTrigger id="type">
                      <SelectValue placeholder="Select" />
                    </SelectTrigger>
                    <SelectContent position="popper">
                      {frameworks.map((framework, index) => (
                        <SelectItem key={index} value={framework.toLowerCase()}>
                          {framework}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
              </div>
            </form>
          </CardContent>
          <CardFooter className="flex justify-between">
            <Button variant="outline" onClick={onCancel}>
              Cancel
            </Button>
            <Button onClick={onSubmit}>{buttonText}</Button>
          </CardFooter>
        </Card>
      </motion.div>
    </>
  );
}
